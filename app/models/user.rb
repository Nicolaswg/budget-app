class User < ApplicationRecord
	has_many :agreements, foreign_key: 'author_id'
	has_many :groups, foreign_key: 'author_id'
end
