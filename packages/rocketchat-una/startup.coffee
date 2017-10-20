RocketChat.settings.add 'Accounts_OAuth_UNA_URL', '', { type: 'string', group: 'OAuth', public: true, section: 'UNA', i18nLabel: 'URL' }
RocketChat.settings.add 'Accounts_OAuth_UNA_Site_Name', 'UNA', { type: 'string', group: 'OAuth', public: true, section: 'UNA', i18nLabel: 'Site_Name' }
RocketChat.settings.add 'Accounts_OAuth_UNA', false, { type: 'boolean', group: 'OAuth', section: 'UNA', i18nLabel: 'Accounts_OAuth_Custom_Enable' }
RocketChat.settings.add 'Accounts_OAuth_UNA_id', '', { type: 'string', group: 'OAuth', section: 'UNA', i18nLabel: 'Accounts_OAuth_Custom_id' }
RocketChat.settings.add 'Accounts_OAuth_UNA_secret', '', { type: 'string', group: 'OAuth', section: 'UNA', i18nLabel: 'Accounts_OAuth_Custom_Secret' }
RocketChat.settings.add 'Accounts_OAuth_UNA_login_style', 'redirect', { type: 'select' , group: 'OAuth', section: "UNA", i18nLabel: 'Accounts_OAuth_Custom_Login_Style', persistent: true, values: [ { key: 'redirect', i18nLabel: 'Redirect' }, { key: 'popup', i18nLabel: 'Popup' }, { key: '', i18nLabel: 'Default' } ] }
RocketChat.settings.add 'Accounts_OAuth_UNA_button_label_text', '', { type: 'string' , group: 'OAuth', section: "UNA", i18nLabel: 'Accounts_OAuth_Custom_Button_Label_Text', persistent: true }
RocketChat.settings.add 'Accounts_OAuth_UNA_button_label_color', '#FFFFFF', { type: 'string' , group: 'OAuth', section: "UNA", i18nLabel: 'Accounts_OAuth_Custom_Button_Label_Color', persistent: true }
RocketChat.settings.add 'Accounts_OAuth_UNA_button_color', '#13679A', { type: 'string', group: 'OAuth', section: 'UNA', i18nLabel: 'Accounts_OAuth_Custom_Button_Color', persistent: true }
