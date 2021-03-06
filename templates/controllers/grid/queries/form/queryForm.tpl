{**
 * templates/controllers/grid/queries/form/queryForm.tpl
 *
 * Copyright (c) 2014-2015 Simon Fraser University Library
 * Copyright (c) 2003-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Query grid form
 *
 *}

<script>
	// Attach the handler.
	$(function() {ldelim}
		$('#queryForm').pkpHandler(
			'$.pkp.controllers.form.CancelActionAjaxFormHandler',
			{ldelim}
				cancelUrl: {if $isNew}'{url|escape:javascript op="deleteQuery" queryId=$queryId params=$actionArgs escape=false}'{else}null{/if}
			{rdelim}
		);
	{rdelim});
</script>

<form class="pkp_form" id="queryForm" method="post" action="{url op="updateQuery" queryId=$queryId params=$actionArgs}">

	{include file="controllers/notification/inPlaceNotification.tpl" notificationId="queryFormNotification"}

	{fbvFormArea id="queryUsersArea"}
		{url|assign:queryUsersUrl router=$smarty.const.ROUTE_COMPONENT component="listbuilder.users.QueryUsersListbuilderHandler" op="fetch" queryId=$queryId params=$actionArgs escape=false}
		{load_url_in_div id="queryUsersContainer" url=$queryUsersUrl}
	{/fbvFormArea}

	{fbvFormArea id="queryContentsArea"}
		{fbvFormSection title="common.subject" for="subject" required="true"}
			{fbvElement type="text" id="subject" value=$subject}
		{/fbvFormSection}

		{fbvFormSection title="stageParticipants.notify.message" for="comment" required="true"}
			{fbvElement type="textarea" id="comment" rich=true value=$comment}
		{/fbvFormSection}
	{/fbvFormArea}

	{fbvFormArea id="queryNoteFilesArea"}
		{url|assign:queryNoteFilesGridUrl router=$smarty.const.ROUTE_COMPONENT component="grid.files.query.QueryNoteFilesGridHandler" op="fetchGrid" params=$actionArgs queryId=$queryId noteId=$noteId escape=false}
		{load_url_in_div id="queryNoteFilesGrid" url=$queryNoteFilesGridUrl}
	{/fbvFormArea}

	{fbvFormButtons id="addQueryButton"}
</form>
<p><span class="formRequired">{translate key="common.requiredField"}</span></p>
