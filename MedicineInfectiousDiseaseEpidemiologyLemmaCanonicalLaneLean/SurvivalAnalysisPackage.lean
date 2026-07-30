import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineInfectiousDiseaseEpidemiologyLemmaCanonicalLaneLean

structure SurvivalAnalysisPackage where
  hazardFunction : Type u
  survivalFunction : Type v
  censoringIndicator : Prop
  timeToEventDistribution : Prop
  proportionalHazardsAssumption : Prop

structure SurvivalAnalysisEvidence (S : SurvivalAnalysisPackage) where
  hazardFunctionClosed : S.hazardFunction
  survivalFunctionClosed : S.survivalFunction
  censoringIndicatorClosed : S.censoringIndicator
  timeToEventDistributionClosed : S.timeToEventDistribution
  proportionalHazardsAssumptionClosed : S.proportionalHazardsAssumption

def SurvivalAnalysisClosed (S : SurvivalAnalysisPackage) : Prop :=
  S.hazardFunction ∧ S.survivalFunction ∧ S.censoringIndicator ∧
  S.timeToEventDistribution ∧ S.proportionalHazardsAssumption

theorem survival_analysis_closed_from_evidence (S : SurvivalAnalysisPackage)
    (E : SurvivalAnalysisEvidence S) : SurvivalAnalysisClosed S := by
  exact And.intro E.hazardFunctionClosed
    (And.intro E.survivalFunctionClosed
      (And.intro E.censoringIndicatorClosed
        (And.intro E.timeToEventDistributionClosed E.proportionalHazardsAssumptionClosed)))

end MedicineInfectiousDiseaseEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse
