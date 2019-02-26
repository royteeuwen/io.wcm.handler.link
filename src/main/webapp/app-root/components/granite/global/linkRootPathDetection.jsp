<%--
  #%L
  wcm.io
  %%
  Copyright (C) 2019 wcm.io
  %%
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at
  
       http://www.apache.org/licenses/LICENSE-2.0
  
  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
  #L%
  --%>
<%@page import="com.day.cq.wcm.api.PageManager"%>
<%@page import="com.day.cq.wcm.api.Page"%>
<%@page import="io.wcm.handler.link.spi.LinkHandlerConfig"%>
<%@page import="io.wcm.wcm.ui.granite.util.GraniteUi"%>
<%@page import="org.apache.sling.api.resource.Resource"%>
<%@page import="org.apache.sling.api.SlingHttpServletRequest"%><%!

static String getRootPath(SlingHttpServletRequest request, String linkTypeId, String fallbackRootPath) {
  String rootPath = null;

  Page contentPage = GraniteUi.getContentPage(request);
  if (contentPage != null) {
    LinkHandlerConfig linkHandlerConfig = contentPage.getContentResource().adaptTo(LinkHandlerConfig.class);
    rootPath = linkHandlerConfig.getLinkRootPath(contentPage, linkTypeId);
  }

  if (rootPath == null) {
    rootPath = fallbackRootPath;
  }

  return rootPath;
}

%>
