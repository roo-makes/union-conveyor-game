using System.Collections;
using System.Collections.Generic;
using Sirenix.OdinInspector;
using UnityEngine;

namespace _Framework
{
    [CreateAssetMenu(fileName = "IntVariable", menuName = "Framework/IntVariable")]
    public class IntVariable : ScriptableObject
    {
        public int Value;

        public override string ToString()
        {
            return Value.ToString();
        }
    }
}