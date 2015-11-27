module NightcrawlerSwift
  class Upload < Command

    def execute path, file, opts = {}
      body = file.read
      headers = {etag: etag(body), content_type: content_type(file)}

      max_age = opts[:max_age] || options.max_age
      headers.merge!(cache_control: "public, max-age=#{max_age}", expires: expires(max_age)) if max_age

      content_encoding = opts[:content_encoding] || options.content_encoding
      headers.merge!(content_encoding: content_encoding.to_s) if content_encoding

      custom_headers = opts[:custom_headers]
      headers.merge!(custom_headers) if custom_headers

      response = put "#{connection.upload_url}/#{path}", body: body, headers: headers
      [200, 201].include?(response.code)
    end

    private

    def content_type file
      MultiMime.by_file(file).content_type
    end

    def etag content
      Digest::MD5.hexdigest(content)
    end

    def expires max_age
      CGI.rfc1123_date(Time.now + max_age)
    end

  end
end
