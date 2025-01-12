class Users::Create < ApplicationService
  def initialize(params)
    @params = params
  end

  def call
    # validate
    create
  end

  private

  def validate

  end

  def create
    Publisher.publish('asd', attributes)
  end
end
