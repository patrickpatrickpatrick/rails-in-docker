# This module should be extracted away yo production code
module FridayStepHelper
  def is_it_friday(day)
    day == 'Friday' ? 'TGIF' : 'Nope'
  end
end
World FridayStepHelper

Given("today is {string}") do |given_day|
  @today = given_day
end

When("I ask whether it's Friday yet") do
  @actual_answer = is_it_friday(@today)
end

Then("I should be told {string}") do |expected_answer|
  expect(@actual_answer).to eq(expected_answer)
end