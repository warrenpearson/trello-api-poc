#!/usr/bin/env ruby

require 'trello'

# Simple Trello client
class TrelloClient
  def initialize
    Trello.configure do |config|
      config.developer_public_key = ENV['TRELLO_DEVELOPER_PUBLIC_KEY']
      config.member_token = ENV['TRELLO_MEMBER_TOKEN']
    end
  end

  def get_orgs(user)
    u = find_user(user)
    puts u.organizations.inspect
  end

  def find_user(user)
    Trello::Member.find(user)
  end

  def get_boards(me)
    me.boards.each do |b|
      puts "#{b.name} [#{b.id}]"
    end
  end

  def find_board(user, board)
    u = find_user(user)
    boards = u.boards.select { |b| b.name == board }
    boards[0]
  end

  def find_list(user, board, list)
    b = find_board(user, board)
    lists = b.lists.select { |l| l.name == list }
    lists[0]
  end

  def find_card(user, board, list, card)
    list = find_list(user, board, list)
    cards = list.cards.select { |c| c.name == card }
    cards[0]
  end

  def show_lists(user, board)
    b = find_board(user, board)
    b.lists.each do |list|
      puts "#{list.id}: #{list.name}"
    end
  end

  def show_cards(board)
    board.cards.each do |card|
      puts "#{card.id}: #{card.name}"
    end
  end

  def add_card(name, list)
    Trello::Card.create(name: name, list_id: list.id)
  end
end
