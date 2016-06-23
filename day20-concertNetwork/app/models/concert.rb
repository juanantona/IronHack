class Concert < ActiveRecord::Base
	
    has_many :comments

	validates :band, presence: true
    validates :band, length: {maximum: 30}
    validates :band, format: {with: /\A[^\s][\sa-zA-Z0-9]+/}

    validates :venue, presence: true
    validates :venue, length: {maximum: 30}
    validates :venue, format: {with: /\A[^\s][\sa-zA-Z0-9]+/}

    validates :city, presence: true
    validates :city, length: {maximum: 30}
    validates :city, format: {with: /\A[^\s][\sa-zA-Z0-9]+/}

    validates :price, presence: true, numericality: true

end
