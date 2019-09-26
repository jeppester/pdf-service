require 'sinatra/base'
require 'open3'
require 'byebug'

class App < Sinatra::Base
  get '/convert' do
    return 'no url provided' unless params[:url]

    stdin, stdout, stderr, wait_thr = Open3.popen3('athenapdf', '-S', '--wait-for-status', params[:url])

    content_type 'application/pdf'
    stdout
  end
end
