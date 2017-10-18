Template.loginHeader.helpers({
	logoUrl() {
		const asset = RocketChat.settings.get('Assets_logo');
		const sDolphinUrl = RocketChat.settings.get('API_Dolphin_URL');
		const sTridentUrl = RocketChat.settings.get('API_Trident_URL');
		const sUnaUrl = RocketChat.settings.get('API_UNA_URL');

		const prefix = __meteor_runtime_config__.ROOT_URL_PATH_PREFIX || '';

        if (sDolphinUrl != null) {
			return sDolphinUrl + '/modules/?r=chat_plus/logo';
        } else if (sTridentUrl != null) {
			return sTridentUrl + '/modules/?r=chat_plus/logo';
        } else if (sUnaUrl != null) {
			return sUnaUrl + '/modules/?r=chat_plus/logo';
        } else if (asset != null) {
			return `${ prefix }/${ asset.url || asset.defaultUrl }`;
		}
	}
});
