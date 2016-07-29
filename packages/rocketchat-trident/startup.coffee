RocketChat.settings.add 'API_Trident_URL', '', { type: 'string', group: 'OAuth', public: true, section: 'Trident' }
RocketChat.settings.add 'Accounts_OAuth_Trident', false, { type: 'boolean', group: 'OAuth', section: 'Trident' }
RocketChat.settings.add 'Accounts_OAuth_Trident_id', '', { type: 'string', group: 'OAuth', section: 'Trident' }
RocketChat.settings.add 'Accounts_OAuth_Trident_secret', '', { type: 'string', group: 'OAuth', section: 'Trident' }
RocketChat.settings.add 'Accounts_OAuth_Trident_login_style', 'redirect', { type: 'select' , group: 'OAuth', section: "Trident", i18nLabel: 'Accounts_OAuth_Custom_Login_Style', persistent: true, values: [ { key: 'redirect', i18nLabel: 'Redirect' }, { key: 'popup', i18nLabel: 'Popup' }, { key: '', i18nLabel: 'Default' } ] }
RocketChat.settings.add 'Accounts_OAuth_Trident_button_label_text', '', { type: 'string' , group: 'OAuth', section: "Trident", i18nLabel: 'Accounts_OAuth_Custom_Button_Label_Text', persistent: true }
RocketChat.settings.add 'Accounts_OAuth_Trident_button_label_color', '#FFFFFF', { type: 'string' , group: 'OAuth', section: "Trident", i18nLabel: 'Accounts_OAuth_Custom_Button_Label_Color', persistent: true }
RocketChat.settings.add 'Accounts_OAuth_Trident_button_color', '#13679A', { type: 'string', group: 'OAuth', section: 'Trident', i18nLabel: 'Accounts_OAuth_Custom_Button_Color', persistent: true }
