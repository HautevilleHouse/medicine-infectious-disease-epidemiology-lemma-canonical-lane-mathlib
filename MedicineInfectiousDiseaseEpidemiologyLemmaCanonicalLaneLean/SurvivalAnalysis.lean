import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineInfectiousDiseaseEpidemiologyLemmaCanonicalLaneLean

structure SurvivalModel where
  hazardFunction : Prop
  survivalFunction : Prop
  censoringMechanism : Prop
  proportionalHazards : Prop

structure SurvivalModelEvidence (S : SurvivalModel) where
  hazardFunctionClosed : S.hazardFunction
  survivalFunctionClosed : S.survivalFunction
  censoringMechanismClosed : S.censoringMechanism
  proportionalHazardsClosed : S.proportionalHazards

def SurvivalModelClosed (S : SurvivalModel) : Prop :=
  S.hazardFunction ∧ S.survivalFunction ∧ S.censoringMechanism ∧ S.proportionalHazards

theorem survival_model_closed_from_evidence (S : SurvivalModel)
    (E : SurvivalModelEvidence S) : SurvivalModelClosed S := by
  exact And.intro E.hazardFunctionClosed
    (And.intro E.survivalFunctionClosed
      (And.intro E.censoringMechanismClosed E.proportionalHazardsClosed))

end MedicineInfectiousDiseaseEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse