module ResponseHelper
  class JResponse
    attr_accessor :response_body, :status, :error_code, :error_msg
    def initialize
      self.response_body = nil
      self.status = 200
      self.error_msg = []
    end

    def set_status(status)
      self.status = status
    end

    def set_error(message, error_code=-1, code=403)
      self.status = code
      self.error_code = error_code
      self.error_msg.push message
    end

    def done
      if (self.status != 200)
          data = {error: parse_error}
      else
          data = {data: parse_response}
      end
      data.merge!(status: self.status)
    end

    def set_success_response
      self.response_body = { success: true }
      self.status = 200
    end

    def set_response_body(args)
      self.response_body = args
    end

    def set_success_response_with_data(args)
      set_success_response
      self.response_body.merge!(args)
    end

    private
    def parse_error
      {
        code: self.error_code,
        messages: self.error_msg
      }
    end

    def parse_response
      response_body
    end
  end

  def initialize_response
    JResponse.new
  end
end
