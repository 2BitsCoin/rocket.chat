/* globals menu*/

Template.sideNav.helpers({
	flexTemplate() {
		return SideNav.getFlex().template;
	},

	flexData() {
		return SideNav.getFlex().data;
	},

	footer() {

		const sSiteName = RocketChat.settings.get('Site_Name');
		const sDolphinUrl = RocketChat.settings.get('API_Dolphin_URL');
		const sTridentUrl = RocketChat.settings.get('API_Trident_URL');
		const sUnaUrl = RocketChat.settings.get('API_UNA_URL');
		const sSideNavFooter = RocketChat.settings.get('Layout_Sidenav_Footer');
		if (sSideNavFooter != null && sSideNavFooter.length) {
			return sSideNavFooter;
        } else if (sDolphinUrl.length && 0 == sTridentUrl.length && 0 == sUnaUrl.length) {
			return '<div style="height:50%; width:100%; position:relative;"><a style="display:block; text-align:center; width:100%; position:absolute; bottom:0; right:0; line-height:0;" href="' + sDolphinUrl + '" target="_blank">' + t("Goto_main_site") + '</a></div>';
        } else if (sTridentUrl.length && 0 == sDolphinUrl.length && 0 == sUnaUrl.length) {
			return '<div style="height:50%; width:100%; position:relative;"><a style="display:block; text-align:center; width:100%; position:absolute; bottom:0; right:0; line-height:0;" href="' + sTridentUrl + '" target="_blank">' + t("Goto_main_site") + '</a></div>';
        } else if (sUnaUrl.length && 0 == sDolphinUrl.length && 0 == sTridentUrl.length) {
			return '<div style="height:50%; width:100%; position:relative;"><a style="display:block; text-align:center; width:100%; position:absolute; bottom:0; right:0; line-height:0;" href="' + sUnaUrl + '" target="_blank">' + t("Goto_main_site") + '</a></div>';
        }
	},

	roomType() {
		return RocketChat.roomTypes.getTypes();
	},

	loggedInUser() {
		return !!Meteor.userId();
	}
});

Template.sideNav.events({
	'click .close-flex'() {
		return SideNav.closeFlex();
	},

	'click .arrow'() {
		return SideNav.toggleCurrent();
	},

	'mouseenter .header'() {
		return SideNav.overArrow();
	},

	'mouseleave .header'() {
		return SideNav.leaveArrow();
	},

	'scroll .rooms-list'() {
		return menu.updateUnreadBars();
	},

	'dropped .sidebar'(e) {
		return e.preventDefault();
	}
});

Template.sideNav.onRendered(function() {
	SideNav.init();
	menu.init();

	const first_channel_login = RocketChat.settings.get('First_Channel_After_Login');
	const room = RocketChat.roomTypes.findRoom('c', first_channel_login, Meteor.userId());
	if (room !== undefined && room._id !== '') {
		FlowRouter.go(`/channel/${ first_channel_login }`);
	}

	return Meteor.defer(() => menu.updateUnreadBars());
});

Template.sideNav.onCreated(function() {
	this.mergedChannels = new ReactiveVar(false);

	this.autorun(() => {
		const user = RocketChat.models.Users.findOne(Meteor.userId(), {
			fields: {
				'settings.preferences.roomsListExhibitionMode': 1,
				'settings.preferences.mergeChannels': 1
			}
		});
		let userPref = null;
		if (user && user.settings && user.settings.preferences) {
			userPref = user.settings.preferences.roomsListExhibitionMode === 'category' && user.settings.preferences.mergeChannels;
		}

		this.mergedChannels.set((userPref != null) ? userPref : RocketChat.settings.get('UI_Merge_Channels_Groups'));
	});
});
