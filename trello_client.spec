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
    board = client.find_board('warrenpearson', 'Barclays Windows')
    expect(board.name).to eq 'Barclays Windows'
  end
end

describe 'find_list' do
  it 'checks the name of a user board\'s list is returned correctly' do
    list = client.find_list('warrenpearson', 'Barclays Windows', 'ToDo')
    expect(list.name).to eq 'ToDo'
  end
end

describe 'find_card' do
  it 'checks the name of a specific card is returned correctly' do
    card = client.find_card('warrenpearson', 'Barclays Windows',
                            'Blocked', 'Admin access on supermarket')
    expect(card.name).to eq 'Admin access on supermarket'
  end
end
