Template.loginHeader.helpers
	logoUrl: ->
		sDolphinUrl = RocketChat.settings.get 'API_Dolphin_URL'
		sTridentUrl = RocketChat.settings.get 'API_Trident_URL'
		sUnaUrl = RocketChat.settings.get 'API_UNA_URL'
		asset = RocketChat.settings.get('Assets_logo')
		if sDolphinUrl?
			return sDolphinUrl + '/modules/?r=chat_plus/logo'
		else if sTridentUrl?
			return sTridentUrl + '/modules/?r=chat_plus/logo'
		else if sUnaUrl?
			return sUnaUrl + '/modules/?r=chat_plus/logo'
		else if asset?
			return asset.url or asset.defaultUrl
