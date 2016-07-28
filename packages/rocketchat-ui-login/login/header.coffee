Template.loginHeader.helpers
	logoUrl: ->
		sDolphinUrl = RocketChat.settings.get 'API_Dolphin_URL'
		sTridentUrl = RocketChat.settings.get 'API_Trident_URL'
		asset = RocketChat.settings.get('Assets_logo')
		else if sDolphinUrl?
			return sDolphinUrl
		else if sTridentUrl?
			return sTridentUrl
		else if asset?
			return asset.url or asset.defaultUrl
