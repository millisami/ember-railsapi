class ApplicationController < ActionController::API

  def render(*args)
    if args.first.key?(:json) && args.first[:json].kind_of?(ActiveRecord::Base) && !args.first.key?(:status)
      if args.first[:json].destroyed?
        args.first[:status] = 204
      elsif args.first[:json].created?
        args.first[:status] = 201
      end
    end

    super
  end
end
