module Berkeley
  class GraduateMilestones

    QE_STATUS_CODE_PASSED = 'P'

    QE_STATUS_FAILED = 'Failed'
    QE_STATUS_PARTIALLY_FAILED = 'Partially Failed'
    QE_STATUS_PASSED = 'Passed'

    QE_APPROVAL_MILESTONE = 'AAGQEAPRV'
    QE_RESULTS_MILESTONE = 'AAGQERESLT'

    def self.get_status(status_code)
      statuses.try(:[], status_code.strip.upcase) unless status_code.blank?
    end

    def self.get_description(milestone_code)
      milestones.try(:[], milestone_code.strip.upcase).try(:[], :milestone) unless milestone_code.blank?
    end

    def self.get_order_number(milestone_code)
      milestones.try(:[], milestone_code.strip.upcase).try(:[], :order) unless milestone_code.blank?
    end

    def self.get_form_notification(milestone_code, status_code)
      form_notifications.try(:[], milestone_code.strip.upcase) unless (status_code === 'Y' || milestone_code.blank?)
    end

    def self.milestones
      @milestones ||= {
        'AAGADVMAS1' => {
          :milestone => 'Advancement to Candidacy (Thesis Plan)',
          :order => 2
        },
        'AAGADVMAS2' => {
          :milestone => 'Advancement to Candidacy (Capstone Plan)',
          :order => 3
        },
        'AAGACADP1' => {
          :milestone => 'Thesis File Date',
          :order => 5
        },
        QE_APPROVAL_MILESTONE => {
          :milestone => 'Approval for Qualifying Exam',
          :order => 1
        },
        QE_RESULTS_MILESTONE => {
          :milestone => 'Qualifying Exam Results',
          :order => 2
        },
        'AAGADVPHD' => {
          :milestone => 'Advancement to Candidacy',
          :order => 3
        },
        'AAGDISSERT' => {
          :milestone => 'Dissertation File Date',
          :order => 5
        },
        'AAGACADP2' => {
          :milestone => 'Capstone',
          :order => 6
        },
      }
    end

    def self.statuses
      @statuses ||= {
        'F' => QE_STATUS_FAILED,
        'PF' => QE_STATUS_PARTIALLY_FAILED,
        QE_STATUS_CODE_PASSED => QE_STATUS_PASSED,
        'N' => 'Not Satisfied',
        'Y' => 'Completed'
      }
    end

    def self.form_notifications
      @form_notifications ||= {
        'AAGADVMAS1' => '(Form Required)',
        'AAGQEAPRV' => '(Form Required)'
      }
    end
  end
end
