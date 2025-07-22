# Discord app protocol routes

## Home
- `/` : `discord://-/` or `discord:///`
- friends : `discord://-/channels/@me/`
- nitro : `discord://-/store`
- shop : `discord://-/shop`
- message requests : `discord://-/message-requests`
- family centre : `discord://-/family-center`
## General
- apps : `discord://-/apps`
- discovery : `discord://-/discovery/` (servers discovery page)
  - discovery - guilds : `discord://-/guild-discovery` (servers discovery page)
  - discovery - servers : `discord://-/discovery/servers`
  - discovery - applications : `discord://-/discovery/applications`
  - discovery - quest : `discord://-/discovery/quests`
- gift : `discord://-/gifts/<gift_code>`
- gift (with login screen) : `discord://-/gifts/<gift_code>/login`
- new server : `discord://-/guilds/create`
- server invite : `discord://-/invite/<invite_code>`
- server invite (with login screen) : `discord://-/invite/<invite_code>/login`
- developer portal : `discord://-/developer`
## Settings
### User settings
- user settings : `discord://-/settings/<setting_name>`
  - User settings - my account : `discord://-/settings/account`
  - User settings - profiles : `discord://-/settings/profile-customization`
  - User settings - privacy and safety : `discord://-/settings/privacy-and-safety`
  - User settings - family : `discord://-/settings/family-center`
  - User settings - authorized apps : `discord://-/settings/authorized-apps`
  - User settings - connections : `discord://-/settings/connections`
  - User settings - devices : `discord://-/settings/sessions`
  - User settings - friend requests : `discord://-/settings/friend-requests`
  - Payment settings - Discord Nitro : `discord://-/settings/premium`
  - Payment settings - server boost : `discord://-/settings/guild-boosting`
  - Payment settings - subscriptions : `discord://-/settings/subscriptions`
  - Payment settings - gift inventory : `discord://-/settings/inventory`
  - Payment settings - billing : `discord://-/settings/billing`
  - App settings - appearance : `discord://-/settings/appearance`
  - App settings - accessibility : `discord://-/settings/accessibility`
  - App settings - voice & video : `discord://-/settings/voice`
  - App settings - text & images : `discord://-/settings/text`
  - App settings - notifications : `discord://-/settings/notifications`
  - App settings - keybinds : `discord://-/settings/keybinds`
  - App settings - language : `discord://-/settings/locale`
  - App settings - windows settings : `discord://-/settings/windows`
  - App settings - linux settings : `discord://-/settings/linux`
  - App settings - steamer mode : `discord://-/settings/streamer-mode`
  - App settings - advanced : `discord://-/settings/advanced`
  - Activity settings - activity privacy - `discord://-/settings/activity-privacy`
  - Activity settings - registered games - `discord://-/settings/registered-games`
  - Activity settings - game overlay : `discord://-/settings/overlay`
  - Hypesquad : `discord://-/settings/hypesquad-online`
  - Changelog : `discord://-/settings/changelogs`
  - Experiments : `discord://-/settings/experiments`
  - Developer options : `discord://-/settings/developer-options`
  - Hotspot options : `discord://-/settings/hotspot-options`
  - Dismissible Contents : `discord://-/settings/dismissible-content-options`
### Guild settings
- guild settings : `discord://-/guilds/<guild_id>/settings`
  - overview : `discord://-/guilds/<guild_id>//overview`
  - roles : `discord://-/guilds/<guild_id>//roles`
  - emoji : `discord://-/guilds/<guild_id>//emoij`
  - stickers : `discord://-/guilds/<guild_id>//stickers`
  - widget : `discord://-/guilds/<guild_id>//widget`
  - server template : `discord://-/guilds/<guild_id>//guild-templates`
  - soundboard : `discord://-/guilds/<guild_id>//soundboard`
  - custom invite link : `discord://-/guilds/<guild_id>//vanity-url`
  - Apps - integrations : `discord://-/guilds/<guild_id>//integrations`
  - Apps - app directory : `discord://-/guilds/<guild_id>//app-directory` (empty page)
  - Moderation - safety setup : `discord://-/guilds/<guild_id>//safety`
  - Moderation - audit log : `discord://-/guilds/<guild_id>//audit-log`
  - Moderation - bans : `discord://-/guilds/<guild_id>//bans`
  - Community - overview : `discord://-/guilds/<guild_id>//community`
  - Community - onboarding : `discord://-/guilds/<guild_id>//onboarding`
  - Community - server insights : `discord://-/guilds/<guild_id>//analytics`
  - Community - partner programme : `discord://-/guilds/<guild_id>//partner`
  - Community - discovery : `discord://-/guilds/<guild_id>//discovery`
  - Community - server web page `discord://-/guilds/<guild_id>//discovery-landing-page`
  - Community - welcome screen : `discord://-/guilds/<guild_id>//community-welcome`
  - Monetization - Server subscriptions : `discord://-/guilds/<guild_id>//role-subscriptions`
  - Server boost status : `discord://-/guilds/<guild_id>//guild-premium`
  - User managament - members : `discord://-/guilds/<guild_id>//members`
  - User managament - invites : `discord://-/guilds/<guild_id>//instant-invites`
  - Delete : `discord://-/guilds/<guild_id>//delete`
## User
- user profile : `discord://-/users/<user_id>`

## Guilds and DMs
- dm channel : `discord://-/channels/@me/<channel_id>`
- dm message : `discord://-/channels/@me/<channel_id>/<message_id>`
- favorites : `discord://-/channels/@favorites`
- favorites channel : `discord://-/channels/@favorites/<channel_id>`
- guild : `discord://-/channels/<guild_id>`
- guild channel : `discord://-/channels/<guild_id>/<channel_id>`
- guild browse channels : `discord://channels/<guild_id>/channel-browser`
- guild customise (onboarding) : `discord://channels/<guild_id>/customize-community` 
- guild server guide channel : `discord://-/channels/<guild_id>/@home`
- guild event : `discord://-/events/<guild_id>/<event_id>`
- guild message : `discord://-/channels/<guild_id>/<channel_id>/<message_id>`
- guild member safety : `discord://-/channels/<guild_id>/member-safety`
- guild membership screening : `discord://-/member-verification/<guild_id>`
- guild role subscriptions : `discord://-/channels/<guild_id>/role-subscriptions`
- hub membership screening : `discord://-/member-verification-for-hub/<hub_id>`

## Library
- library : `discord://-/library/`
- library inventory : `discord://-/library/inventory`
  - Launch : `discord://-/library/<sku_id>/launch`
- library settings : `discord://-/library/settings/`
- store page : `discord://-/store/skus/<sku_id>`
- store page : `discord://-/store/applications/<application_id>`

## Account
- login : `discord://-/login` (options : `?redirect_to=`)
- register : `discord://-/register` (options : `?redirect_to=`)
- reset : `discord://-/reset`
- restore : `discord://-/restore`
- OAuth App : `discord://-/oauth2/authorize?<OAUTH2_URL>`

## Events
If an event is over, the link might not work anymore

- snowsgiving (Discord's yearly event in december) : `discord://-/snowsgiving`
- 8th birthday : `discord://-/activities`
- loot boxes : `discord://-/settings/lootboxes`

## Old routes
- guild subscription plans : `discord://-/guilds/<guild_id>/premium-guild-subscriptions`