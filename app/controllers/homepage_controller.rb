class HomepageController < ApplicationController
  def index
    @opinions = Opinion.all.ordered_by_most_recent
  end
end
