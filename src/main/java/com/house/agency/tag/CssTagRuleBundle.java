package com.house.agency.tag;

import org.sitemesh.SiteMeshContext;
import org.sitemesh.content.ContentProperty;
import org.sitemesh.content.tagrules.TagRuleBundle;
import org.sitemesh.content.tagrules.html.ExportTagToContentRule;
import org.sitemesh.tagprocessor.State;

public class CssTagRuleBundle implements TagRuleBundle {

	public void cleanUp(State state, ContentProperty contentProperty,
			SiteMeshContext siteMeshContext) {
		
	}

	public void install(State state, ContentProperty contentProperty,
			SiteMeshContext siteMeshContext) {
		state.addRule("css", new ExportTagToContentRule(
				siteMeshContext, contentProperty.getChild("css"), false));
	}

}
