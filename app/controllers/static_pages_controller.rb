class StaticPagesController < ApplicationController
  before_action :is_admin, only: [:admin]
  def home
  end

  def help
  end

  def admin
  end
end
