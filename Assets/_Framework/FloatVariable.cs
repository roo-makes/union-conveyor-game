using System.Collections;
using System.Collections.Generic;
using Sirenix.OdinInspector;
using UnityEngine;

namespace _Framework
{
    [CreateAssetMenu(fileName = "FloatVariable", menuName = "Framework/FloatVariable")]
    public class FloatVariable : ScriptableObject
    {
        public float Value;

        public override string ToString()
        {
            return Value.ToString();
        }

        public void SetValue(float newVal)
        {
            Value = newVal;
        }
    }
}