import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineInfectiousDiseaseEpidemiologyLemmaCanonicalLaneLean

structure DiagnosticInferencePackage where
  truePositiveRate : Float
  falsePositiveRate : Float
  priorPrevalence : Float
  testAccuracy : Prop
  posteriorProbability : Float

structure DiagnosticInferenceEvidence (D : DiagnosticInferencePackage) where
  truePositiveRateClosed : D.truePositiveRate ≥ 0 ∧ D.truePositiveRate ≤ 1
  falsePositiveRateClosed : D.falsePositiveRate ≥ 0 ∧ D.falsePositiveRate ≤ 1
  priorPrevalenceClosed : D.priorPrevalence ≥ 0 ∧ D.priorPrevalence ≤ 1
  testAccuracyClosed : D.testAccuracy
  posteriorProbabilityClosed : D.posteriorProbability ≥ 0 ∧ D.posteriorProbability ≤ 1

def DiagnosticInferenceClosed (D : DiagnosticInferencePackage) : Prop :=
  (D.truePositiveRate ≥ 0 ∧ D.truePositiveRate ≤ 1) ∧
  (D.falsePositiveRate ≥ 0 ∧ D.falsePositiveRate ≤ 1) ∧
  (D.priorPrevalence ≥ 0 ∧ D.priorPrevalence ≤ 1) ∧
  D.testAccuracy ∧
  (D.posteriorProbability ≥ 0 ∧ D.posteriorProbability ≤ 1)

theorem diagnostic_inference_closed_from_evidence (D : DiagnosticInferencePackage)
    (E : DiagnosticInferenceEvidence D) : DiagnosticInferenceClosed D := by
  exact And.intro E.truePositiveRateClosed
    (And.intro E.falsePositiveRateClosed
      (And.intro E.priorPrevalenceClosed
        (And.intro E.testAccuracyClosed E.posteriorProbabilityClosed)))

end MedicineInfectiousDiseaseEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse
