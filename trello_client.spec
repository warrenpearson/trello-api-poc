require_relative 'trello_client.rb'

client = TrelloClient.new

describe 'find_user' do
  it 'checks the full_name of a specified user is returned correctly' do
    user = client.find_user('warrenpearson')
    expect(user.full_name).to eq 'Warren Pearson'
  end
end

describe 'find_board' do
  it 'checks the name of a user\'s board is returned correctly' do
    board = client.find_board('warrenpearson', 'TrelloAPI Test')
    expect(board.name).to eq 'TrelloAPI Test'
  end
end

describe 'find_list' do
  it 'checks the name of a user board\'s list is returned correctly' do
    list = client.find_list('warrenpearson', 'TrelloAPI Test', 'ToDo')
    expect(list.name).to eq 'ToDo'
  end
end

describe 'find_card' do
  it 'checks the name of a specific card is returned correctly' do
    card = client.find_card('warrenpearson', 'TrelloAPI Test',
                            'ToDo', 'My first card')
    expect(card.name).to eq 'My first card'
  end
end
