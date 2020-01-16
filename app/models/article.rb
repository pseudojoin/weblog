require 'elasticsearch/model'

class Article < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  settings do
    mappings dynamic: false do
      indexes :title, type: :text, analyzer: :english
      indexes :text, type: :text, analyzer: :english
      indexes :comment, type: :text, analyzer: :english
    end
  end

  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: {minimum: 5}

  def self.search_filtered(query)
    self.search({
      query: {
        bool: {
          must: [
          {
            multi_match: {
              query: query,
              fields: [:title, :text]
            }
          },
          {
            match: {
              # published: true
            }
          }]
        }
      }
    })
  end
end