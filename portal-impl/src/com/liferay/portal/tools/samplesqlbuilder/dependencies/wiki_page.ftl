<#setting number_format = "0">

insert into WikiPage values ('${portalUUIDUtil.generate()}', ${wikiPage.pageId}, ${wikiPage.resourcePrimKey}, ${wikiPage.groupId}, ${companyId}, ${wikiPage.userId}, '', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, ${wikiPage.nodeId}, '${wikiPage.title}', ${wikiPage.version}, FALSE, '${wikiPage.content}', ${wikiPage.status}, ${wikiPage.statusByUserId}, '${wikiPage.statusByUserName}', CURRENT_TIMESTAMP, '', 'creole', <#if wikiPage.head>TRUE<#else>FALSE</#if>, '', '');

insert into WikiPageResource values (${wikiPage.resourcePrimKey}, ${wikiPage.nodeId}, '${wikiPage.title}');

${sampleSQLBuilder.insertSecurity("com.liferay.portlet.wiki.model.WikiPage", wikiPage.resourcePrimKey)}

<#if wikiPage.head>
	<#assign assetEntry = dataFactory.addAssetEntry(wikiNode.groupId, wikiPage.userId, dataFactory.wikiPageClassName.classNameId, wikiPage.resourcePrimKey, "text/html", wikiPage.title)>

	${sampleSQLBuilder.insertAssetEntry(assetEntry)}
</#if>