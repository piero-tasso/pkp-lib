{**
 * templates/user/contactForm.tpl
 *
 * Copyright (c) 2014-2015 Simon Fraser University Library
 * Copyright (c) 2003-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * User profile form.
 *}
<script type="text/javascript">
	$(function() {ldelim}
		// Attach the form handler.
		$('#contactForm').pkpHandler('$.pkp.controllers.form.AjaxFormHandler');
	{rdelim});
</script>

<form class="pkp_form" id="contactForm" method="post" action="{url op="saveContact"}">
	{include file="controllers/notification/inPlaceNotification.tpl" notificationId="contactFormNotification"}

	{fbvFormSection}
		{fbvElement type="text" label="user.email" id="email" value=$email size=$fbvStyles.size.LARGE required=true}
		{fbvElement type="text" label="user.phone" name="phone" id="phone" value=$phone maxlength="24" inline=true size=$fbvStyles.size.SMALL}
		{fbvElement type="text" label="user.fax" name="fax" id="fax" value=$fax maxlength="24" inline=true size=$fbvStyles.size.SMALL}
		{fbvElement type="text" label="user.affiliation" multilingual="true" name="affiliation" id="affiliation" value=$affiliation size=$fbvStyles.size.LARGE}
	{/fbvFormSection}
	{fbvFormSection}
		{fbvElement type="textarea" label="common.mailingAddress" name="mailingAddress" id="mailingAddress" rich=true value=$mailingAddress size=$fbvStyles.size.LARGE}
		{fbvElement type="select" label="common.country" name="country" id="country" required=true defaultLabel="" defaultValue="" from=$countries selected=$country translate=false size=$fbvStyles.size.MEDIUM}
	{/fbvFormSection}

	{if count($availableLocales) > 1}
		{fbvFormSection title="user.workingLanguages" list=true}
			{foreach from=$availableLocales key=localeKey item=localeName}
				{if $userLocales && in_array($localeKey, $userLocales)}
					{assign var="checked" value=true}
				{else}
					{assign var="checked" value=false}
				{/if}
				{fbvElement type="checkbox" name="userLocales[]" id="userLocales-$localeKey" value=$localeKey checked=$checked label=$localeName translate=false}
			{/foreach}
		{/fbvFormSection}
	{/if}

	{fbvFormButtons hideCancel=true submitText="common.save"}

	<p><span class="formRequired">{translate key="common.requiredField"}</span></p>
</form>
