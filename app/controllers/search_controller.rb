class SearchController < ApplicationController
  def search
    #formからの入力を受け取る
    if postal_code = params[:postal_code]
      #postal_codeをparamsに格納
      #params = URI.encode_www_form({ zipcode: postal_code })
      params = URI.encode_www_form({ zipcode: postal_code })
      uri = URI.parse("http://zipcloud.ibsnet.co.jp/api/search?#{params}")
      #uri = URI.parse("http://zipcloud.ibsnet.co.jp/api/search?#{params}")
      response = Net::HTTP.get_response(uri)
      result = JSON.parse(response.body)
      if result["results"]
        #取ってきて表示させる
        @zipcode = result["results"][0]["zipcode"]
        @address1 = result["results"][0]["address1"]
        @address2 = result["results"][0]["address2"]
        @address3 = result["results"][0]["address3"]
      end
    end
  end
end
