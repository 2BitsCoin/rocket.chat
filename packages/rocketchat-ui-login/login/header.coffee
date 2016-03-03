Template.loginHeader.helpers
	header: ->
		sSiteName = RocketChat.settings.get 'Site_Name'
		sHeader = RocketChat.settings.get 'Layout_Login_Header'
		sDolphinUrl = RocketChat.settings.get 'API_Dolphin_URL'
		sTridentUrl = RocketChat.settings.get 'API_Trident_URL'
		if sHeader.length
			sHeader
		else if sDolphinUrl.length and 0 == sTridentUrl.length
			'<a href="/"><img src="' + sDolphinUrl + 'modules/?r=chat_plus/logo" onerror="$(this).remove();" /></a>'
		else if sTridentUrl.length and 0 == sDolphinUrl.length
			'<a href="/"><img src="' + sTridentUrl + 'modules/?r=chat_plus/logo" onerror="$(this).remove();" /></a>'
		else
			sSiteName
