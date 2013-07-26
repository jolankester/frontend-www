class ApplicationController < ActionController::Base
  include Slimmer::Template

  protect_from_forgery
  
  def content_api
    content_api ||= GdsApi::ContentApi.new(
      Plek.current.find("contentapi")
    )
  end
  
  def statsd
    statsd ||= Statsd.new("localhost").tap do |c|
      c.namespace = ENV['GOVUK_STATSD_PREFIX'].to_s
    end
  end
  
end