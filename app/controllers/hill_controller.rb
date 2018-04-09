class HillController < ApplicationController
	def visit
		@bucket = Bucket.new
		@bucket.size = rand(10)
		@bucket.weight = rand(1000)
		@bucket.is_full = @bucket.weight > 500
		@bucket.save!
		@bucket_count = Bucket.count
	end

	def read
		@bucket_count = Bucket.count
	end

end
