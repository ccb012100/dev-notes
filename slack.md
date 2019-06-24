# Slack

## Open Slack with Developer tools

`$ export SLACK_DEVELOPER_MENU=true; open -a /Applications/Slack.app`

## dark theme

(<https://gist.github.com/focus97/21a8b7f130f0afd0b26f0d84f3a02d2b>)

- note that I'm using a URL where I'm hosting the CSS rather than <https://cdn.rawgit.com/laCour/slack-night-mode/master/css/raw/black.css>
- open _/Applications/Slack.app/Contents/Resources/app.asar.unpacked/src/static/ssb-interop.js_
- before closing bracket on last line, paste:

```javascript
    let tt__customCss = `body, .channel_header, #footer, .channel_title_info, #channel_topic_text {background: #282A36; } /* main background color */
    a.c-link.c-member_slug.c-member_slug--link.c-member_slug--mention { color: black } /* color of your username when tagged */
    a.c-member_slug--mention, a.c-member_slug--mention:hover { background: #FF79C6 } /* background behind your tagged username */
    a.c-member_slug, .c-member_slug--link, .c-mrkdwn__subteam--link { background: #F1FA8C !important; border: 1px solid #F1FA8C; color: red; } /* tagged username */
    a.c-member_slug.active, a.c-member_slug:hover, .c-member_slug--link.active, .c-member_slug--link:hover, .c-mrkdwn__subteam--link.active, .c-mrkdwn__subteam--link:hover { color: green; } /* tagged username when mouse pointer is hovered over it */
    a.internal_member_link.ts_tip.ts_tip_top.ts_tip_float.ts_tip_member.mention.ts_tip_hidden { color: #F1FA8C !important; } /* you own tagged username in unread messages */
    button.c-link--button.c-message_kit__labels__link { color: #FFB86C; } /* label text for shared message in thread */
    i.c-icon.c-icon--chevron-medium-left { color: #F1FA8C; } /* back arrow in pinned file details in sidebar */
    nav.p-channel_sidebar .p-channel_sidebar__channel--selected, .p-channel_sidebar__link--selected, .c-message_list__day_divider__label__pill, .p-message_pane .c-message_list.c-virtual_list--scrollbar > .c-scrollbar__hider:before { color: #F8F8F2!important;background: #FF79C6 !important; } /* day label for day separators in message pane */
    pre {} /* code blocks */
    span.c-app_label { color: pink; } /* app label for app integration messages */
    span.file_meta_expaned { color: #BD93F9; } /* unread message list - collapsed attachment in message - name of attachment sender */
    ts-mention.c-member_slug.c-member_slug--link.ts_tip_texty { color: black !important; } /* user/group tag in message input textbar */
    #msg_form #msg_input {border-color: transparent;} /* message input section */
    #msg_input, #primary_file_button { background: #121212 !important; } /* background of message textbar */
    #team_menu, .p-channel_sidebar { background: #282A36 !important; } /* sidebar background color */
    .app_preview_link_slug.ts_tip, .internal_member_link.ts_tip, .internal_user_group_link.ts_tip { color: #BD93F9 !important; } /* tagged username in Unread messages */
    .c-icon--presence-offline:before { color:#F1FA8C } /* status indicator before offline user */
    .c-member_slug { color: #F8F8F2;background: #F1FA8C } /* tagged username in message */
    .c-message .c-button--outline { background: black; color: white; border-color: F1FA8C; } /* add-file button to left of message input textbar */
    .c-message__body { color: #F8F8F2; } /* color of messages in main window */
    .c-message__body > a.c-link { color: #6272A4; }
    .c-message__reply_bar:hover .c-message__reply_bar_view_thread{ background-color: #BD93F9; color: #44475A; padding-left: 5px; border-radius: 5px;} /* "view threads" message */
    .c-message__sender a { color: #BD93F9 } /* username above message in thread list */
    .c-message_kit__background--labels { background: #424450 } /* background for shared message in thread */
    .c-message_list__day_divider__line { border-top-color: #FF79C6!important} /* horizontal line separating days in the message pane */
    .c-message--light .c-message__sender .c-message__sender_link { color: #BD93F9} /* username link above message */
    .c-mrkdwn__user_group--link { background: #FF5555; color: black; } /* tagged usergroup */
    .c-pillow_file__content--collapsed:after { background: linear-gradient(0deg,black,hsla(0,0%,100%,0) 40px) } /* gradient at bottom of collapsed message/attachment */
    .c-pillow_file__post__content code, .c-pillow_file__post__content pre { background: #282A36; } /* code block in pinned post */
    .c-presence--active {color: #FF79C6 !important;} /* status indicator before active user */
    .c-reaction_add__icon--fg { color: #F1FA8C } /* color of 'add reaction' icon */
    .c-timestamp__label { color: #FF79C6; } /* pinned file details - timestamp */
    .email_container.email_reset .email_inline_collapsed_content .email_header .file_header_meta { color: #FFB86C; } /* name of email integration in Unread pane */
    .email_container.email_reset .email_inline_collapsed_content .email_header .file_header_title { color: #FF79C6; } /* title of email message in unread messages */
    .filetype_icon.snippet.s30:before, .filetype_icon.snippet.s48:before, .ts_icon_file_snippet:before { color: #FFB86C;} /* file icon in sidebar "Shared Files" section */
    .p-channel_sidebar__channel--selected .c-icon--presence-offline:before { color:#fff } /* username text in sidebar for offline users */
    .p-channel_sidebar__channel--selected .c-presence--active {color: #fff !important;} /* text color of current channel in sidebar */
    .p-file_details__user_link, .p-file_details__user_link:link, .p-file_details__user_link:visited { color: #FF79C6; } /* pinned file in channel - name of user who created shared file */
    .p-file_details__user_meta { color: #6272A4; } /* file info for pinned file in channel */
    .p-file_details__share_divider span { color: #BD93F9; } /* file details in sidebar - text that says "Shared in" */
    .p-notification_bar__typing { color: #FF79C6 } /* text under textbar that notifies you that someone is typing */
    .p-threads_flexpane__header_channel_name { color: #FF79C6 } /* channel name link at top of Thread */
    .rxn, .c-reaction, .c-reaction_add, .c-member_slug { border: 1px solid #F1FA8C; } /* color of icon on 'add reaction' icon under a message */
    .rxn, .c-reaction, .c-reaction, .c-member_slug { border: 1px solid #F1FA8C; } /* border around emoji reactions under a message */
    .thrills_purple { color: #BD93F9!important; } /* Apps icon in channel sidebar */
    .unread_empty_state_refresh { background: inherit !important; } /* unread messages tab - refresh button section */
    .unread_group a.timestamp.ts_tip.ts_tip_top.ts_tip_float.ts_tip_hidden.ts_tip_multiline.ts_tip_delay_300 { color: #BD93F9; } /* unread messages - timestamp */
    `;
  $.ajax({
    url:
      'https://gist.githubusercontent.com/ccb012100/12b2219822c02abc25b60cc72ab99616/raw/71633188ec4ab5304e6be521bd5c71e9e9c92f8a/slack-dark.css',
    success: function(css) {
      $('<style></style>')
        .appendTo('head')
        .html(css + tt__customCss);
    }
  });
});
```
