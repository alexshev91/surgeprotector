require 'rails_helper'

RSpec.describe PriceResult, :type => :model do

	it "should save results to the database and associate it with price query" do
		example_query_sf = PriceQuery.create({
			:start_latitude => 37.786958,
      :start_longitude => -122.394462,
      :end_latitude => 37.787933,
      :end_longitude => -122.4074981,
      :city => "San Francisco"
    })

  	example_query_sf.price_results.create({
      "localized_display_name"=>"uberX",
      "low_estimate"=>"5",
      "display_name"=>"uberX",
      "product_id"=>"a1111c8c-c720-46c3-8534-2fcdd730040d",
      "surge_multiplier"=>1.0,
      "estimate"=>"$5-7",
      "high_estimate"=>"7",
      "currency_code"=>"USD"
    })

  	expect(example_query_sf.price_results).not_to eq(nil)

	end

end