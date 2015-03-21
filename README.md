# メールを標準入力で渡して Slack に通知するスクリプト

/etc/aliases とかで受信したメールをこのスクリプトにパイプすると
slack に通知されます。

``/etc/aliases``
```
alerts: "|mail-to-slack.rb"
```
