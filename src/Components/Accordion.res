@react.component
let make = () => {
  <div>
    <Mui.Accordion>
      <Mui.AccordionSummary
        expandIcon={<ExpandMoreIcon />} ariaControls="panel1-content" id="panel1-header">
        {React.string("Accordion 1")}
      </Mui.AccordionSummary>
      <Mui.AccordionDetails>
        {React.string(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse malesuada lacus ex, sit amet blandit leo lobortis eget. 1",
        )}
      </Mui.AccordionDetails>
      <Mui.Accordion>
        <Mui.AccordionSummary
          expandIcon={<ExpandMoreIcon />} ariaControls="panel1-content" id="panel1-header">
          {React.string("Accordion 1")}
        </Mui.AccordionSummary>
        <Mui.AccordionDetails>
          {React.string(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse malesuada lacus ex, sit amet blandit leo lobortis eget. 1",
          )}
        </Mui.AccordionDetails>
      </Mui.Accordion>
    </Mui.Accordion>
  </div>
}
