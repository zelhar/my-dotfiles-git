### My Settings
c.tabs.background = True
#c.content.pdfjs = True
#c.content.javascript.enabled = True
c.content.javascript.enabled = False

#### Javascript general and specific domain settings
config.set('content.javascript.enabled', True, '*://old.reddit.com/*')
config.set('content.javascript.enabled', True, '*://www.reddit.com/*')
config.set('content.javascript.enabled', True, '*://*.reddit.com/*')
config.set('content.javascript.enabled', True, '*://seekingalpha.com/*')
config.set('content.javascript.enabled', True, '*://email.seekingalpha.com/*')
config.set('content.javascript.enabled', True, '*://mail.google.com/*')
config.set('content.javascript.enabled', True, '*://google.com/*')
config.set('content.javascript.enabled', True, '*://yahoo.com/*')
config.set('content.javascript.enabled', True, '*://*.yahoo.com/*')
config.set('content.javascript.enabled', True, '*://*.fu-berlin.de/*')
config.set('content.javascript.enabled', True, '*://maya.tase.co.il/*')
config.set('content.javascript.enabled', True, '*://www.ebay.com/*')
config.set('content.javascript.enabled', True, '*://cart.ebay.com/*')
config.set('content.javascript.enabled', True, '*://pay.ebay.com/*')
config.set('content.javascript.enabled', True, '*://www.ebay.de/*')
config.set('content.javascript.enabled', True, '*://cart.ebay.de/*')
config.set('content.javascript.enabled', True, '*://pay.ebay.de/*')
config.set('content.javascript.enabled', True, '*://www.amazon.com/*')
config.set('content.javascript.enabled', True, '*://www.amazon.de/*')
config.set('content.javascript.enabled', True, '*://www.comdirect.de/*')
config.set('content.javascript.enabled', True, '*://www.aliexpress.com/*')
config.set('content.javascript.enabled', True, '*://github.com/*')
#config.set('content.javascript.enabled', True, '*://google.*/*')
#config.set('content.javascript.enabled', True, '*://www.amazon.*/*')
#config.set('content.javascript.enabled', True, '*://www.ebay.*/*')

### Blocklists

#mylists00 = "https://github.com/easylist/EasyListHebrew/raw/master/EasyListHebrew.txt"
#mylists01 = "https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&showintro=1&mimetype=plaintext&_=211223"
#mylists02 = "https://easylist.to/easylist/easylist.txt"
#mylists03 = "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/annoyances.txt"
#c.content.host_blocking.lists.append(mylists00)
#c.content.host_blocking.lists.append(mylists01)
#c.content.host_blocking.lists.append(mylists02)
#c.content.host_blocking.lists.append(mylists03)
#mylists = "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/badware.txt"
#c.content.host_blocking.lists.append(mylists)
#mylists = "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/experimental.txt"
#c.content.host_blocking.lists.append(mylists)
#mylists = "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt"
#c.content.host_blocking.lists.append(mylists)
#mylists = "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt"
#c.content.host_blocking.lists.append(mylists)
#mylists = "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/resource-abuse.txt"
#c.content.host_blocking.lists.append(mylists)
#mylists = "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/resources.txt"
#c.content.host_blocking.lists.append(mylists)
#mylists = "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/unbreak.txt"
#c.content.host_blocking.lists.append(mylists)
#mylists = "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/thirdparties/easylist-downloads.adblockplus.org/easyprivacy.txt"
#c.content.host_blocking.lists.append(mylists)
#mylists = "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/thirdparties/easylist-downloads.adblockplus.org/easylist.txt"
#c.content.host_blocking.lists.append(mylists)
#mylists = "https://filters.adtidy.org/extension/chromium/filters/2.txt"
#c.content.host_blocking.lists.append(mylists)
#mylists = "https://filters.adtidy.org/extension/chromium/filters/4.txt"
#c.content.host_blocking.lists.append(mylists)
#mylists = "https://filters.adtidy.org/extension/chromium/filters/14.txt"
#c.content.host_blocking.lists.append(mylists)
#mylists = "https://filters.adtidy.org/extension/chromium/filters/6.txt"
#c.content.host_blocking.lists.append(mylists)
#mylists = "https://filters.adtidy.org/extension/chromium/filters/11.txt"
#c.content.host_blocking.lists.append(mylists)
#mylists = "https://filters.adtidy.org/extension/chromium/filters/15.txt"
#c.content.host_blocking.lists.append(mylists)

# Binding Keys
config.bind('tg', 'tab-give')
