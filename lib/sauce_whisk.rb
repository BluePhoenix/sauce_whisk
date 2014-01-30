require "sauce_whisk/rest_request_builder"
require "sauce_whisk/version"
require "sauce_whisk/jobs"
require "sauce_whisk/assets"
require "sauce_whisk/tunnels"
require "sauce_whisk/info"
require "sauce_whisk/accounts"



module SauceWhisk

  def self.base_url
    "https://saucelabs.com/rest/v1"
  end

  def self.username
    if defined? ::Sauce
      return ::Sauce::Config.new[:username]
    else
      return ENV["SAUCE_USERNAME"]
    end
  end

  def self.password
    if defined? ::Sauce
      return ::Sauce::Config.new[:access_key]
    else
      return ENV["SAUCE_ACCESS_KEY"]
    end
  end

  def self.pass_job(job_id)
    Jobs.pass_job job_id
  end

  def self.logger=(logger)
    @logger = logger
  end

  def self.logger
    @logger||= STDOUT
  end

  def self.public_link(job_id)
    key        = "#{self.username}:#{self.password}"
    auth_token = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('md5'), key, job_id)

    "https://saucelabs.com/jobs/#{job_id}?auth=#{auth_token}"
  end
end
