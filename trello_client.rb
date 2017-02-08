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

  def orgs(user_name)
    u = user(user_name)
    u.organizations
  end

  def user(user_name)
    Trello::Member.find(user_name)
  end

  def boards(user_name)
    u = user(user_name)
    u.boards
  end

  def board(user_name, board_name)
    u = user(user_name)
    boards = u.boards.select { |b| b.name == board_name }
    boards[0]
  end

  def list(user_name, board_name, list_name)
    b = board(user_name, board_name)
    lists = b.lists.select { |l| l.name == list_name }
    lists[0]
  end

  def card(user_name, board_name, list_name, card_name)
    l = list(user_name, board_name, list_name)
    cards = l.cards.select { |c| c.name == card_name }
    cards[0]
  end

  def lists(user_name, board_name)
    b = board(user_name, board_name)
    b.lists
  end

  def cards(board)
    board.cards.each do |card|
      puts "#{card.id}: #{card.name}"
    end
  end
 
  def labels(user_name, board_name)
    b = board(user_name, board_name)
    b.labels
  end

  def members(user_name, board_name)
    b = board(user_name, board_name)
    b.members
  end

  def add_card(name, list)
    Trello::Card.create(name: name, list_id: list.id)
  end
end
