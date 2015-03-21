#!/usr/local/bin/ruby

WEBHOCKURL = "<IncomingWebHocksURL>"

require 'mail'
require 'slack-notifier'

mail = Mail.new(STDIN.read)

attachment = {
  color: "danger",
  pretext: mail.subject,
  text: mail.body.decoded.encode('UTF-8', mail.charset)
}

attachment['color'] = "good" if mail.subject.index('OK') === 0

notifier = Slack::Notifier.new WEBHOCKURL
notifier.channel = '#alerts'
notifier.username = mail.from.first
notifier.ping '', attachments: [ attachment ]
