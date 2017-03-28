Template.loginHeader.helpers
	logoUrl: ->
		sDolphinUrl = RocketChat.settings.get 'API_Dolphin_URL'
		sTridentUrl = RocketChat.settings.get 'API_Trident_URL'
		sUnaUrl = RocketChat.settings.get 'API_UNA_URL'
		asset = RocketChat.settings.get('Assets_logo')
		prefix = __meteor_runtime_config__.ROOT_URL_PATH_PREFIX || ''
		if sDolphinUrl?
			return sDolphinUrl + '/modules/?r=chat_plus/logo'
		else if sTridentUrl?
			return sTridentUrl + '/modules/?r=chat_plus/logo'
		else if sUnaUrl?
			return sUnaUrl + '/modules/?r=chat_plus/logo'
		else if asset?
			return prefix + '/' + (asset.url or asset.defaultUrl)
