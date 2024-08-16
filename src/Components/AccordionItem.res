@react.component
let make = (~summary, ~detailsContent, ~summaryClassName=?, ~detailsClassName=?) => {
  <Mui.Accordion>
    <Mui.AccordionSummary
      //   className={summaryClassName}
      className={switch summaryClassName {
      | Some(className) => className
      | None => ""
      }}
      expandIcon={<ExpandMoreIcon />}
      ariaControls="panel-content"
      id="panel-header">
      //   {React.string(summary)}
      {summary}
    </Mui.AccordionSummary>
    <Mui.AccordionDetails
      className={switch detailsClassName {
      | Some(className) => className
      | None => ""
      }}>
      {detailsContent}
    </Mui.AccordionDetails>
  </Mui.Accordion>
}
