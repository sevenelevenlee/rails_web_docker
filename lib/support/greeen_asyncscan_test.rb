本文件是  内容检测(暴恐涉政／鉴黄）相关内容，线上正确使用后删除
https://www.zhihu.com/question/39392500
确定选择：阿里云盾
https://ak-console.aliyun.com/?spm=a2c4g.11186623.2.12.dq1dpi&accounttraceid=b724d092-5d2c-4933-ba4a-5b2eb02644fe#/accesskey
https://www.aliyun.com/price/product?spm=5176.2020520130.105.2.Qns80S&msctype=pmsg&mscareaid=cn&mscsiteid=cn&mscmsgid=5650118062100362584#/lvwang/detail
https://common-buy.aliyun.com/?spm=5176.8050869.0.0.12982c88ZIDNwj&commodityCode=cdibag#/buy
https://yundun.console.aliyun.com/?spm=5176.6660585.774526198.1.52cc6bf8tNqxQe&p=cts#/greenWeb/config2?tabIndex=4
https://help.aliyun.com/document_detail/70292.html?spm=a2c4g.11186623.6.572.0c1Mgb


本系统现使用异步接口，以下测试为图片 同步接口：（如有需要后续使用）

conn = Faraday.new(:url => 'http://www.example.com')
conn.post do |req|
  req.url '/nigiri'
  req.headers['Content-Type'] = 'application/json'
  req.body = '{ "name": "Unagi" }'
end


http = Faraday.new :url => 'http://green.cn-shanghai.aliyuncs.com/green/image/scan', :headers => {'X-API-Token' => 'foo'}

# change it after initialization
http.headers['X-API-Token'] = 'foo'

body=
{"scenes"=> ["porn"],
"tasks"=> [
{"dataId"=> "11111112",
"url"=> "https://www.baidu.com/img/bd_logo1.png"}
]
}
nonce = SecureRandom.uuid
# body_md5_base64 = Base64.strict_encode64(OpenSSL::Digest::MD5.digest(body.to_json.encode('utf-8')))
body_md5_base64 = OpenSSL::Digest::MD5.base64digest(body.to_json)

acs = "x-acs-signature-method:HMAC-SHA1\nx-acs-signature-nonce:#{nonce}\nx-acs-signature-version:1.0\nx-acs-version:2018-05-09\n"
uri = '/green/image/scan'
clientInfo = {"userNick":"Mike","userType":"others"}
uri_query = uri# + "?clientInfo="+clientInfo.to_json
time_gmt = Time.now.utc.to_formatted_s(:rfc822).gsub('+0000','GMT')

data_to_sign = "POST\napplication/json\n" + body_md5_base64 + "\n" + "application/json" + "\n" + time_gmt + "\n" + acs + uri_query

access_key_id = 'LTAIVtmWeFZjz07m'
access_key_secret = 'G4BeqLqNyh8LooKLDgT4aigkYEe1CN'
signature = Base64.strict_encode64(OpenSSL::HMAC.digest('sha1', access_key_secret, data_to_sign))
# signature = Base64.encode64(OpenSSL::HMAC.digest('sha1', access_key_secret, data_to_sign))

authorization = "acs" + " " + access_key_id + ":" + signature

headers=
{'Accept'=> 'application/json','Content-Type'=> 'application/json','Content-MD5'=> body_md5_base64,'Date'=> time_gmt,
  'x-acs-version'=> '2018-05-09','x-acs-signature-nonce'=> nonce,'x-acs-signature-version'=> '1.0',
  'x-acs-signature-method'=> 'HMAC-SHA1','Authorization'=> authorization
}

conn = Faraday.new :url => 'http://green.cn-shanghai.aliyuncs.com', :headers => headers#, :body => body.to_json
conn.body = body.to_json

response = conn.post do |req|
  req.url '/green/image/scan'
  # req.url '/green/image/scan'+"?clientInfo="+clientInfo.to_json
  req.body = body.to_json
end

response.body

conn1 = Faraday.new :url => 'http://green.cn-shanghai.aliyuncs.com', :headers => headers#, :body => body.to_json
response1 = conn1.post '/green/image/scan', body.to_json
response1.body
