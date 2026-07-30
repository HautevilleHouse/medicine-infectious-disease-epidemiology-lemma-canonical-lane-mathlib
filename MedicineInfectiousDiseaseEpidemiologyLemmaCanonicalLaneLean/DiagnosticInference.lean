import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineInfectiousDiseaseEpidemiologyLemmaCanonicalLaneLean

structure DiagnosticTest where
  sensitivity : Prop
  specificity : Prop
  positivePredictiveValue : Prop
  negativePredictiveValue : Prop

structure DiagnosticTestEvidence (T : DiagnosticTest) where
  sensitivityClosed : T.sensitivity
  specificityClosed : T.specificity
  positivePredictiveValueClosed : T.positivePredictiveValue
  negativePredictiveValueClosed : T.negativePredictiveValue

def DiagnosticTestClosed (T : DiagnosticTest) : Prop :=
  T.sensitivity ∧ T.specificity ∧ T.positivePredictiveValue ∧ T.negativePredictiveValue

theorem diagnostic_test_closed_from_evidence (T : DiagnosticTest)
    (E : DiagnosticTestEvidence T) : DiagnosticTestClosed T := by
  exact And.intro E.sensitivityClosed
    (And.intro E.specificityClosed
      (And.intro E.positivePredictiveValueClosed E.negativePredictiveValueClosed))

end MedicineInfectiousDiseaseEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse