/**
 * @description       : 
 * @author            : Cristiana Jipa BearingPoint GmbH
 * @group             : 
 * @last modified on  : 02-28-2023
 * @last modified by  : Cristiana Jipa BearingPoint GmbH
**/
public class LeadSubmissionForm_CX {

    private Lead newLead;
    private ApexPages.StandardController stdController;
    String showError;

    public String getShowError() {
        return showError;
    }

    public void setShowError(String s) {
        showError = s;
    }

    public LeadSubmissionForm_CX(ApexPages.StandardController stdController) {
        this.stdController = stdController;
        this.showError = '';
    }

    public PageReference save() {
         System.debug('We are saving this lead');
         PageReference detailPage = this.stdController.save();
         this.newLead = (Lead)stdController.getRecord();
         if (detailPage != null) {
             PageReference viewLeadPDF = new PageReference('/apex/LeadViewPDF?id=' + this.newLead.Id);
             viewLeadPDF.setRedirect(true);
             return viewLeadPDF;
        } 
        
         else {
             return detailPage;
        }
 }
    }