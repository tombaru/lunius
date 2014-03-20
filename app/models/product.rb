class Product < ActiveRecord::Base
	belongs_to :category
	mount_uploader :photo, PhotoUploader

	has_many :line_items
	has_many :orders, through: :line_items
	before_destroy :ensure_not_referenced_by_any_line_item

	#...

	private

	# убеждаемся в отсуствии товарных позиций, ссылающихся на данный товар
	def ensure_not_referenced_by_any_line_item
			if line_items.empty?
					return true
			else
					errors.add(:base, 'существуют товарные позиции')
					return false
			end
	end
end
