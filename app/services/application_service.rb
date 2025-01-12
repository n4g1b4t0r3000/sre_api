class ApplicationService
  def initialize(*args, **kwargs, &lambda); end

  def self.call(*args, **kwargs, &lambda)
    lambda ? new(*args, **kwargs, &lambda).call : new(*args, **kwargs).call
  end

  def call; end
end
