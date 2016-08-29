require 'bunny'

namespace :worker do
  desc "TODO"
  task run: :environment do
    

    begin
      Rails.logger.info "Running RabbitMQ listner on #RABBITMQ_CONFIG[:user]@#{RABBITMQ_CONFIG[:host]}:#{RABBITMQ_CONFIG[:port]}/#{RABBITMQ_CONFIG[:vhost]}"

      conn=Bunny.new(
        :hostname => RABBITMQ_CONFIG[:host],
        :port => RABBITMQ_CONFIG[:port],
        :user => RABBITMQ_CONFIG[:user],
        :pass => RABBITMQ_CONFIG[:password],
        :vhost => RABBITMQ_CONFIG[:vhost]
        )

      conn.start


      ch=conn.create_channel
      exchange=ch.fanout(RABBITMQ_CONFIG[:log_exchange_name], :durable => true)
      queue=ch.queue("#{RABBITMQ_CONFIG[:application_id]}_queue", :durable => true)

      queue.bind exchange

      queue.subscribe do |delivery_info, _properties, body|
        puts "Receive message"
        ProcessJsonMessage.new(body)
      end

      puts " [*] Waiting for messages. To exit press CTRL+C"
      loop do
        sleep(1)
      end
    rescue SystemExit, Interrupt => _
      self.stop
    end

  end

end
