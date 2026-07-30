import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineInfectiousDiseaseEpidemiologyLemmaCanonicalLaneLean

structure VaccineEfficacyPackage where
  vaccineEfficacy : Prop
  relativeRiskReduction : Prop
  numberNeededToVaccinate : Prop
  herdImmunityThreshold : Prop

structure VaccineEfficacyEvidence (V : VaccineEfficacyPackage) where
  vaccineEfficacyClosed : V.vaccineEfficacy
  relativeRiskReductionClosed : V.relativeRiskReduction
  numberNeededToVaccinateClosed : V.numberNeededToVaccinate
  herdImmunityThresholdClosed : V.herdImmunityThreshold

def VaccineEfficacyClosed (V : VaccineEfficacyPackage) : Prop :=
  V.vaccineEfficacy ∧ V.relativeRiskReduction ∧ V.numberNeededToVaccinate ∧ V.herdImmunityThreshold

theorem vaccine_efficacy_closed_from_evidence (V : VaccineEfficacyPackage) (E : VaccineEfficacyEvidence V) :
    VaccineEfficacyClosed V := by
  exact And.intro E.vaccineEfficacyClosed (And.intro E.relativeRiskReductionClosed (And.intro E.numberNeededToVaccinateClosed E.herdImmunityThresholdClosed))

end MedicineInfectiousDiseaseEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse