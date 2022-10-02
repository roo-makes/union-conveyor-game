using System;
using System.Collections;
using System.Collections.Generic;
using Sirenix.OdinInspector;
using UnityEngine;

namespace _Framework
{
    [CreateAssetMenu(fileName = "BoolVariable", menuName = "Framework/BoolVariable")]
    public class BoolVariable : ScriptableObject
    {
        [OnValueChanged("ValueChanged")]
        public bool Value;
        public event Action<bool> OnChange;

        public override string ToString()
        {
            return Value.ToString();
        }

        public void SetValue(bool newVal)
        {
            Value = newVal;
            ValueChanged();
        }

        public void ValueChanged()
        {
            OnChange.Invoke(Value);
        }
    }
}