require_relative '../trello_client.rb'

client = TrelloClient.new

describe 'user' do
  it 'checks the full_name of a specified user is returned correctly' do
    user = client.user('warrenpearson')
    expect(user.full_name).to eq 'Warren Pearson'
  end
end

describe 'board' do
  it 'checks the name of a user\'s board is returned correctly' do
    board = client.board('warrenpearson', 'TrelloAPI Test')
    expect(board.name).to eq 'TrelloAPI Test'
  end
end

describe 'list' do
  it 'checks the name of a user board\'s list is returned correctly' do
    list = client.list('warrenpearson', 'TrelloAPI Test', 'ToDo')
    expect(list.name).to eq 'ToDo'
  end
end

describe 'card' do
  it 'checks the name of a specific card is returned correctly' do
    card = client.card('warrenpearson', 'TrelloAPI Test',
                            'ToDo', 'My first card')
    expect(card.name).to eq 'My first card'
  end
end

describe 'labels' do
  it 'checks the labels associated with a board' do
    labels = client.labels('warrenpearson', 'TrelloAPI Test')
    colors = []
    labels.each { |l| colors << l.color }
    expect(colors).to include('green')
  end
end

describe 'members' do
  it 'checks the members associated with a board' do
    members = client.members('warrenpearson', 'TrelloAPI Test')
    expect(members[0].full_name).to eq('Warren Pearson')
  end
end
