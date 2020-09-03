<#if executionData.job.group??>
    <#assign jobName="${executionData.job.group} / ${executionData.job.name}">
<#else>
    <#assign jobName="${executionData.job.name}">
</#if>
<#assign message="Job <${executionData.job.href}|${executionData.project}${jobName}>">
<#if trigger == "start">
    <#assign state="Started">
<#elseif trigger == "failure">
    <#assign state="Failed">
<#elseif trigger == "avgduration">
    <#assign state="Average exceeded">
<#elseif trigger == "retryablefailure">
   <#assign state="Retry Failure">
<#else>
   <#assign state="Succeeded">
</#if>

{
<#if channel??>
   "channel":"${channel}",
</#if>
   "attachments":[
      {
         "fallback":"${state}: ${message}",
         "pretext":"${message}",
         "color":"${color}",
         "fields":[
            {
               "title":"Status",
               "value":"${state}",
               "short":true
            },
            {
               "title":"Log Output",
               "value":"<${executionData.href}#output|Task #${executionData.id}>",
               "short":true
            },
            {
               "title":"Started By",
               "value":"${executionData.user}",
               "short":true
            },
            {
               "title":"Started On",
               "value":"${executionData.dateStartedW3c}",
               "short":true
            }
]
      }
   ]
}
